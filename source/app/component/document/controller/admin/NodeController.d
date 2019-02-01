module app.component.document.controller.admin.NodeController;

import hunt.framework;
import hunt.logging;
import hunt.util.DateTime;
import hunt.util.Serialize;
import hunt.http.codec.http.model.HttpMethod;
import hunt.entity.domain;

import app.lib.controller.AdminBaseController;
import app.component.system.model.Language;
import app.component.project.model.ProjectMini;
import app.component.document.model.DocBase;
import app.component.document.model.Node;
import app.component.document.model.ItemMini;
import app.component.document.model.Item;
import app.component.system.repository.LanguageRepository;
import app.component.project.repository.ProjectMiniRepository;
import app.component.project.model.ProjectMini;
import app.component.document.repository.DocBaseRepository;
import app.component.document.repository.NodeRepository;
import app.component.document.repository.ItemMiniRepository;
import app.component.document.repository.ItemRepository;
import app.component.system.helper.Utils;
import std.conv;
import std.algorithm.iteration;

alias EntityCondition = hunt.entity.domain.Condition.Condition;

class NodeController : AdminBaseController {

    mixin MakeController;
  
    private LanguageRepository _langRepo;
    private DocBaseRepository _docRepo;
    private ProjectMiniRepository _pmRepo;
    private NodeRepository _nodeRepo;
    private ItemMiniRepository _imRepo;
    private ItemRepository _itemRepo;

    this(){
        super();
        _langRepo = new LanguageRepository();
        _docRepo = new DocBaseRepository();
        _pmRepo = new ProjectMiniRepository();
        _nodeRepo = new NodeRepository();
        _imRepo = new ItemMiniRepository();
        _itemRepo = new ItemRepository();
    }

    /**
     * 节点列表
     *  ---- update: 增加 sussessMessages / errorMessages 的提示信息 
     */
    @Action Response list(){

        string[string] conditions;
        int page = initInt("page", 1, "GET");
        int parentId = initInt("parent_id", 0, "GET");
        int docId = initInt("doc_id", 0, "GET");

        if(docId < 1 || page < 1 || parentId < 0){
            this.assignError("数据不存在，请确认后重试");
            return new RedirectResponse(request, url("document.document.list", null, "admin"));
        }

        conditions["parent_id"] = parentId.to!string;
        conditions["document_id"] = docId.to!string;

        auto languages = (new LanguageRepository).findAll();
        auto projects = (new ProjectMiniRepository).findAll();
        auto document = (new DocBaseRepository).find(docId);
        auto pageData = (new NodeRepository).findPageAll(conditions, page, 20);
        auto allNodeData = pageToJson!Node(pageData);

        string[] nodeIds;
        string nodeIdsStr;
        foreach(node; pageData.getContent()){
		    nodeIds ~= (node.id).to!string;
		}
        nodeIdsStr = join(nodeIds, ",");
        if(nodeIdsStr){
            auto items = (new ItemMiniRepository).findAllByStrIds(nodeIdsStr);
            view.assign("items", items);
        }

        view.assign("languages", languages);
        view.assign("projects", projects);
        view.assign("document", document);
        view.assign("nodes", allNodeData);
        view.assign("docId", docId);

        return new Response(request)
            .setHeader(HttpHeader.CONTENT_TYPE, MimeType.TEXT_HTML_UTF_8.asString())
            .setContent(view.render("document/node/list"));
    }

    // @Action Response edit(NodeForm form){
    @Action Response edit(){

        if(request.methodAsString() == HttpMethod.POST.asString()){
            int now =  cast(int) time();            
            int id = initInt("id", 0, "POST");
            int itemId = initInt("itemId", 0, "POST");
            auto nodeData = new Node();
            auto itemData = new Item();
            int oldPid;
            if(id > 0){
                nodeData = _nodeRepo.find(id);
                oldPid = nodeData.parent_id;
            }else{
                nodeData.created = now;
                nodeData.is_node = 1;
            }
            nodeData.updated = now;

            nodeData.document_id = initInt("document_id", 0, "POST");
            nodeData.language_id = initInt("language_id", 0, "POST");
            nodeData.parent_id = initInt("parent_id", 0, "POST");
            nodeData.sign_key = request.post("sign_key", "").replace(" ", "");
            nodeData.sort = initInt("sort", 0, "POST");
            nodeData.status = cast(short) initInt("status", 0, "POST");
            auto nodeId = (_nodeRepo.save(nodeData)).id;
                    
            if(id > 0)
                itemData = _itemRepo.findLangItemByNodeId(nodeId, nodeData.language_id);
            else
                itemData.created = now;
            itemData.updated = now;

            itemData.language_id = initInt("language_id", 0, "POST");
            itemData.title = request.post("title");
            itemData.content = request.post("content");
            itemData.content_html = request.post("content_html");
            itemData.node_id = nodeId;
            itemData.status = 1;
            _itemRepo.save(itemData);

            // 修改新旧PId状态
            if(nodeData.parent_id != 0){
                auto newParent = _nodeRepo.find(nodeData.parent_id);
                newParent.is_node = 0;
                _nodeRepo.save(newParent);
            }

            if(oldPid > 0 && oldPid != nodeData.parent_id){
                auto childNum = _nodeRepo.countChildNum(oldPid);
                if(childNum == 0){
                    auto oldParent = _nodeRepo.find(oldPid);
                    oldParent.is_node = 1;
                    _nodeRepo.save(oldParent);
                }
            }

            this.assignSussess("数据保存成功！");
            // 更新相关缓存
            _tmpCache.getNodeIdsByDocumentId(nodeData.document_id, true);
            _tmpCache.findItemByNodeSign(nodeData.sign_key, nodeData.document_id, nodeData.language_id, true);
            _tmpCache.cleanFrontMenus(nodeData.document_id, nodeData.language_id);
            _tmpCache.getTopMenu(true);
            string[string] redirectParams;
            redirectParams["doc_id"] = to!string(nodeData.document_id);
            return new RedirectResponse(request, url("document.node.list", redirectParams, "admin"));

        }

        int id = initInt("id", 0, "GET");
        int docId = initInt("doc_id", 0, "GET");

        if(id < 1 && docId < 1){
            this.assignError("数据不存在，请确认后重试");
            return new RedirectResponse(request, url("document.document.list", null, "admin"));
        }

        string editType = "edit";
        if(id == 0)
            editType = "add";
            
        auto languages = _langRepo.findAll(new EntityCondition(" %s = 1", _langRepo.Field.status));


        Node nodeData;
        Item itemData;
        if(id > 0){
            nodeData = _nodeRepo.find(id);
            if(docId < 1 && nodeData is null){
                this.assignError("数据不存在，请确认后重试");
                return new RedirectResponse(request, url("document.document.list", null, "admin"));
            }
            itemData = _itemRepo.findLangItemByNodeId(id, nodeData.language_id);
        }    

        docId = docId > 0 ? docId : nodeData.document_id;

        auto document = _docRepo.find(docId);
        ProjectMini project;
        if(document !is null){
            project = _pmRepo.find(document.project_id);
        }

        auto firstLevels = _nodeRepo.findIdsByPid(docId, 0);
        string strIds;
        Node[] nodes;
        ItemMini[] items;
        if(firstLevels){
            strIds = firstLevels.joiner(",").to!string;
            nodes = _nodeRepo.findAllByStrIds(strIds);
            string nodeIds;
            if(nodes){
                foreach(k, node; nodes){
                    if(k > 0)
                        nodeIds ~= ", ";
                    nodeIds ~= (node.id).to!string;
                }
            }
            items = _imRepo.findItemsByNodeIds(nodeIds, document.main_language);
        }
        
        view.assign("editType", editType);
        view.assign("languages", languages);
        view.assign("nodeData", nodeData);
        view.assign("itemData", itemData);
        view.assign("project", project);
        view.assign("document", document);
        view.assign("nodes", nodes);
        view.assign("items", items);

        return new Response(request)
            .setHeader(HttpHeader.CONTENT_TYPE, MimeType.TEXT_HTML_UTF_8.asString())
            .setContent(view.render("document/node/edit"));
    }

    @Action Response editOter(){
        
        
        if(request.methodAsString() == HttpMethod.POST.asString()){
            int now =  cast(int) time();            
            int id = initInt("id", 0, "POST");
            auto postData = new Item();
            if(id > 0)
                postData = _itemRepo.find(id);
            else
                postData.created = now;
            postData.title = request.post("title");
            postData.content = request.post("content");
            postData.language_id = initInt("language_id", 0, "POST");
            postData.node_id = initInt("node_id", 0, "POST");
            postData.updated = now;
            _itemRepo.save(postData);
            auto node = _nodeRepo.find(postData.node_id);

            // 清缓存
            _tmpCache.findItemByNodeSign(node.sign_key, node.document_id, postData.language_id, true);
            _tmpCache.cleanFrontMenus(node.document_id, postData.language_id);
            _tmpCache.getTopMenu(true);
            string[string] redirectParams;
            redirectParams["doc_id"] = to!string(node.document_id);
            return new RedirectResponse(request, url("document.node.list", redirectParams, "admin"));

        }

        int id = initInt("id", 0, "GET");
        int nodeId = initInt("node_id", 0, "GET");
        int langId = initInt("language_id", 0, "GET");

        if(id < 1 && (nodeId < 1 || langId < 1)){
            // this.assignError("数据不存在，请确认后重试");
            return new Response(request)
                .setHeader(HttpHeader.CONTENT_TYPE, MimeType.TEXT_HTML_UTF_8.asString())
                .setContent(view.render("<script>history.back(-1) </script>"));
        }

        string editType = "edit";
        if(id == 0)
            editType = "add";

        view.assign("editType", editType);
        view.assign("node_id", nodeId);
        view.assign("language_id", langId);

        Item itemData;
        if(id > 0){
            itemData = _itemRepo.find(id);
        }
        view.assign("itemData", itemData);

        return new Response(request)
            .setHeader(HttpHeader.CONTENT_TYPE, MimeType.TEXT_HTML_UTF_8.asString())
            .setContent(view.render("document/node/editOther"));

    }

    /**
     * 物理删除/禁用 
     *  ---- update: 增加 sussessMessages / errorMessages 的提示信息 
     *  ---- 修复跳转 / 修复父级节点是否为内容节点的标记
     */
    @Action Response del(string id, string type = "logic"){
        auto nodeRepo = new NodeRepository();
        int docId;
        try {
            int nodeId = id.to!int;
            auto delData = nodeRepo.findById(nodeId);
            docId = delData.document_id;
            if(type == "Physical"){
                auto num = nodeRepo.countChildNum(nodeId);
                if(num == 0){
                    nodeRepo.removeById(nodeId);
                    this.assignSussess("删除成功！");
                    (new ItemMiniRepository).delItemsByNodeIds(nodeId);
                }else{
                    this.assignError("存在子节点，请先删除子节点");
                }
            }else{
                if(delData){
                    delData.status = 0;
                    nodeRepo.save(delData);
                    this.assignSussess("禁用成功！");
                }else{
                    this.assignError("数据不存在，请确认后重试");
                }
            }

            // 计算父级是否为内容节点
            auto childNum = nodeRepo.countUseableChildNum(delData.parent_id);
            if(childNum == 0){
                auto oldParent = nodeRepo.find(delData.parent_id);
                oldParent.is_node = 1;
                nodeRepo.save(oldParent);
            }

            _tmpCache.getTopMenu(true);

            if(docId && delData){
                string[string] redirectParams;
                redirectParams["doc_id"] = to!string(docId);
                redirectParams["parent_id"] = to!string(delData.parent_id);
                return new RedirectResponse(request, url("document.node.list", redirectParams, "admin"));
            }

        }catch(Exception e){
            this.assignError("参数 id 类型不正确");
        }

        return new RedirectResponse(request, url("document.document.list", null, "admin"));

    }

}