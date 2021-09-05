<core_rt:set var="created" value="${spdxDocumentCreationInfo.created}" />
<core_rt:set var="creator" value="${spdxDocumentCreationInfo.creator}" />
<core_rt:set var="externalDocumentRefs" value="${spdxDocumentCreationInfo.externalDocumentRefs}" />
<table class="table spdx-table three-columns" id="editDocumentCreationInformation">
    <thead>
        <tr>
            <th colspan="3">
                <liferay-ui:message key="2.document.creation.information" />
            </th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td style="display: flex">
                <div class="form-group" style="flex: 1">
                    <label class="mandatory" for="spdxVersion">
                        2.1 SPDX Version
                    </label>
                    <div style="display: flex">
                        <label class="sub-label">SPDX-</label>
                        <input id="spdxVersion" class="form-control needs-validation" rule="regex:^[0-9]+\.[0-9]+$"
                            name="_sw360_portlet_components_SPDX_VERSION" type="text" placeholder="Enter SPDX Version"
                            value="${spdxDocumentCreationInfo.spdxVersion}">
                    </div>
                    <div id="spdxVersion-error-messages">
                        <div class="invalid-feedback" rule="regex">
                            <liferay-ui:message key="formatting.must.be.SPDX-M.N" />
                        </div>
                    </div>
                </div>
                <div class="form-group" style="flex: 1">
                    <label class="mandatory" for="dataLicense">
                        2.2 Data License
                    </label>
                    <input id="dataLicense" class="form-control needs-validation" rule="regex:^[0-9a-zA-Z.-]+$"
                        name="_sw360_portlet_components_DATA_LICENSE" type="text"
                        placeholder="<liferay-ui:message key="enter.data.license" />"
                        value="<sw360:out value="${spdxDocumentCreationInfo.dataLicense}" />">
                    <div id="dataLicense-error-messages">
                        <div class="invalid-feedback" rule="regex">
                            <liferay-ui:message key="string.containing.letters.numbers.and/or.-" />
                        </div>
                    </div>
                </div>
                <div class="form-group" style="flex: 1">
                    <label class="mandatory" for="spdxIdentifier">
                        2.3 SPDX Identifier
                    </label>
                    <div style="display: flex">
                        <label class="sub-label">SPDXRef-</label>
                        <input id="spdxIdentifier" class="form-control needs-validation" rule="regex:^[0-9a-zA-Z.-]+$"
                            name="_sw360_portlet_components_SPDX_IDENTIFIER" type="text"
                            placeholder="Enter SPDX Identifier" value="${spdxDocumentCreationInfo.SPDXID}">
                    </div>
                    <div id="spdxIdentifier-error-messages">
                        <div class="invalid-feedback" rule="regex">
                            <liferay-ui:message key="formatting.must.be.SPDXRef.document" />
                        </div>
                    </div>
                </div>
            </td>
        </tr>
        <tr>
            <td>
                <div class="form-group">
                    <label class="mandatory" for="documentName">
                        2.4. Document Name
                    </label>
                    <input id="documentName" name="_sw360_portlet_components_DOCUMENT_NAME" type="text"
                        class="form-control" placeholder="<liferay-ui:message key=" enter.spdx.document.name" />"
                    value="${spdxDocumentCreationInfo.name}">
                </div>
            </td>
        </tr>
        <tr>
            <td>
                <div class="form-group">
                    <label class="mandatory" for="documentNamespace">
                        2.5 SPDX Document Namespace
                    </label>
                    <input id="documentNamespace" class="form-control needs-validation" rule="isUrl"
                        name="_sw360_portlet_components_DOCUMENT_NAMESPACE" type="text"
                        placeholder="<liferay-ui:message key=" enter.spdx.document.namespace" />"
                    value="${spdxDocumentCreationInfo.documentNamespace}">
                </div>
                <div id="documentNamespace-error-messages">
                    <div class="invalid-feedback" rule="isUrl">
                        <liferay-ui:message key="formatting.must.be.an.URI" />
                    </div>
                </div>
            </td>
        </tr>
        <tr>
            <td class="spdx-full">
                <div class="form-group section">
                    <label for="externalDocumentRefs">
                        2.6 External Document References
                    </label>
                    <div style="display: flex; flex-direction: column; padding-left: 1rem;">
                        <div style="display: flex; flex-direction: row; margin-bottom: 0.75rem;">
                            <label for="externalDocumentRefs" style="text-decoration: underline;"
                                class="sub-title">Select Reference</label>
                            <select id="externalDocumentRefs" type="text" class="form-control spdx-select">
                            </select>
                            <svg class="disabled lexicon-icon spdx-delete-icon-main" name="delete-externalDocRef"
                                data-row-id="" viewBox="0 0 512 512">
                                <title><liferay-ui:message key="delete" /></title>
                                <use href="/o/org.eclipse.sw360.liferay-theme/images/clay/icons.svg#trash"/>
                            </svg>
                        </div>
                        <button class="spdx-add-button-main" id="addNewReferenceBtn">Add new Reference</button>
                    </div>
                    <div style="display: flex; flex-direction: row; margin-bottom: 0.75rem;">
                        <label class="sub-title" for="externalDocumentId">External Document ID</label>
                        <input id="externalDocumentId" style="width: auto; flex: auto;" type="text" class="form-control"
                            placeholder="Enter External Document ID">
                    </div>
                    <div style="display: flex; flex-direction: row; margin-bottom: 0.75rem;">
                        <label class="sub-title" for="externalDocument">External Document</label>
                        <input id="externalDocument" style="width: auto; flex: auto;" type="text" class="form-control"
                            placeholder="Enter External Document">
                    </div>
                    <div style="display: flex;">
                        <label class="sub-title">Checksum</label>
                        <div style="display: flex; flex-direction: column; flex: 7">
                            <div style="display: flex; margin-bottom: 0.75rem;">
                                <input style="flex: 2; margin-right: 1rem;" type="text" class="form-control"
                                    id="checksumAlgorithm" placeholder="Enter Algorithm">
                                <input style="flex: 6;" type="text" class="form-control" id="checksumValue"
                                    placeholder="Enter Value">
                            </div>
                            <!-- <button class="spdx-add-button-sub" onclick="addSub(this)">Add new algorithm</button> -->
                        </div>
                    </div>
                </div>
            </td>
        </tr>
        <tr class="spdx-full">
            <td>
                <div class="form-group">
                    <label for="licenseListVersion">
                        2.7 License List Version
                    </label>
                    <input id="licenseListVersion" class="form-control needs-validation"
                        name="_sw360_portlet_components_LICENSE_LIST_VERSION" type="text"
                        placeholder="Enter License List Version" value="${spdxDocumentCreationInfo.licenseListVersion}">
                </div>
            </td>
        </tr>
        <tr>
            <td>
                <div class="form-group">
                    <label class="mandatory" for="creator">
                        2.8 Creator
                    </label>
                    <div style="display: flex; flex-direction: column;">
                        <div style="display: flex; flex-direction: row; margin-bottom: 0.75rem;">
                            <label class="sub-title" for="creator-anonymous">Anonymous</label>
                            <input id="creator-anonymous" class="spdx-checkbox" type="checkbox" onclick="setAnonymous()"
                                name="_sw360_portlet_components_CREATOR_ANONYNOUS">
                        </div>
                        <div style="display: flex;">
                            <label class="sub-title">List</label>
                            <div style="display: flex; flex-direction: column; flex: 7">
                                <div style="display: flex; margin-bottom: 0.75rem;" name="creatorRow">
                                    <select style="flex: 2; margin-right: 1rem;" type="text"
                                        class="form-control creator-type" placeholder="Enter Type"
                                        onchange="changeCreatorType(this)">
                                        <option value="Organization" selected>Organization</option>
                                        <option value="Person">Person</option>
                                        <option value="Tool">Tool</option>
                                    </select>
                                    <input style="flex: 6; margin-right: 2rem;" type="text"
                                        class="form-control creator-value" placeholder="Enter Value"
                                        value="">
                                    <svg class="disabled lexicon-icon spdx-delete-icon-sub"
                                        name="delete-spdxCreatorType-Person" data-row-id="" onclick="deleteSub(this);"
                                        viewBox="0 0 512 512">
                                        <title><liferay-ui:message key="delete" /></title>
                                        <use href="/o/org.eclipse.sw360.liferay-theme/images/clay/icons.svg#trash"/>
                                    </svg>
                                </div>
                                <button class="spdx-add-button-sub spdx-add-button-sub-creator" onclick="addSub(this)">Add new creator</button>
                            </div>
                        </div>
                    </div>
                </div>
            </td>
        </tr>
        <tr>
            <td style="display: flex; flex-direction: column;">
                <div class="form-group">
                    <label class="mandatory" for="createdDate">
                        2.9 Created
                    </label>
                    <div style="display: flex; flex-direction: row; margin-bottom: 12px;">
                        <input id="createdDate" type="date" class="form-control spdx-date"
                            name="_sw360_portlet_components_CREATED_DATE" placeholder="created.date.yyyy.mm.dd">
                        <input id="createdTime" type="time" step="1" class="form-control spdx-time"
                            name="_sw360_portlet_components_CREATED_TIME" placeholder="created.time.hh.mm.ss">
                    </div>
                </div>
            </td>
        </tr>
    </tbody>
</table>

<script>
    function initDocumentCreation() {
        // 2.1 SPDX Version
        if (documentCreationInformationObj['spdxVersion'].startsWith('SPDX-')) {
            $('#spdxVersion').val(documentCreationInformationObj['spdxVersion'].substr(5).trim());
        } else {
            $('#spdxVersion').val('SPDX-2.2');
        }

        // 2.2 Data License
        if (documentCreationInformationObj['dataLicense'] == '') {
            $('#dataLicense').val('CC0-1.0');
        }

        // 2.3 SPDX Identifier
        if (documentCreationInformationObj['SPDXID'].startsWith('SPDXRef-')) {
            $('#spdxIdentifier').val(documentCreationInformationObj['SPDXID'].substr(8).trim());
        } else {
            $('#spdxIdentifier').val('DOCUMENT');
        }

        // 2.6 External Document References
        if (documentCreationInformationObj.externalDocumentRefs.length == 0) {
            enableSection($('.section-external-doc-ref'), false);
        } else {
            fillSelectbox('#externalDocumentRefs', documentCreationInformationObj.externalDocumentRefs.length);
            fillExternalDocRef(0);
        }

        // 2.8 Creator
        if (documentCreationInformationObj.creator.length == 0) {
            // Need to fill the current user of SW360
        } else {
            for (let i = 0; i < documentCreationInformationObj.creator.length; i++) {
                $('.spdx-add-button-sub-creator').first().click();
                $('.creator-type').last().val(documentCreationInformationObj.creator[i].type);
                $('.creator-value').last().val(documentCreationInformationObj.creator[i].value);
            }
        }

        // 2.9
        if (documentCreationInformationObj.created == '') {
            fillDateTime('#createdDate', '#createdTime', (new Date().toISOString()));
        } else {
            fillDateTime('#createdDate', '#createdTime', documentCreationInformationObj.created);
        }
    }

    // ------------------------- 2.6 External Document References
    // Add data
    $('[name=add-externalDocRef]').on('click', function(e) {
        let newObj = { 'externalDocumentId': '', 'checksum': {'algorithm': '', 'checksumValue': ''}, 'spdxDocument': '' };
        documentCreationInformationObj.externalDocumentRefs.push(newObj);
        addMain($(this));
        $('#externalDocumentRefs').change();
    });

    // Delete data
    $('[name=delete-externalDocRef').on('click', function(e) {
        let selectedIndex = $('#externalDocumentRefs')[0].selectedIndex;
        documentCreationInformationObj.externalDocumentRefs.splice(selectedIndex, 1);
        deleteMain($(this));
    });

    // Change data
    $('#externalDocumentRefs').on('change', function(e) {
        let selectedIndex = $('#externalDocumentRefs')[0].selectedIndex;
        fillExternalDocRef(selectedIndex);
    });

    // Fill data - index start from 0
    function fillExternalDocRef(index) {
        index = $('#externalDocumentRefs')[0].selectedIndex;

        let obj = documentCreationInformationObj.externalDocumentRefs[index];

        $('#externalDocumentId').val(obj['externalDocumentId']);

        $('#externalDocument').val(obj['spdxDocument']);

        if (obj['checksum']['algorithm'].startsWith('checksumAlgorithm_')) {
            $('#checksumAlgorithm').val(obj['checksum']['algorithm'].substr(18));
        } else {
            $('#checksumAlgorithm').val('');
        }

        $('#checksumValue').val(obj['checksum']['checksumValue']);
    }

    function storeExternalDocRef(index) {
        let obj = documentCreationInformationObj.externalDocumentRefs[index];

        obj['externalDocumentId'] = $('#externalDocumentId').val().trim();
        obj['spdxDocument'] = $('#externalDocument').val().trim();

        let algorithm = $('#checksumAlgorithm').val().trim();
        let checksumValue = $('#checksumValue').val().trim();

        if (algorithm == '' || checksumValue == '') {
            obj['checksum']['algorithm']     = '';
            obj['checksum']['checksumValue'] = '';
        } else {
            obj['checksum']['algorithm'] = 'checksumAlgorithm_' + algorithm;
            obj['checksum']['checksumValue'] = checksumValue;
        }
    }

    function storeDocumentCreation() {
        // 2.1 SPDX Version
        if ($('#spdxVersion').val().trim() == '') {
            documentCreationInformationObj['spdxVersion'] = 'SPDX-2.2';
        } else {
            documentCreationInformationObj['spdxVersion'] = 'SPDX-' + $('#spdxVersion').val().trim();
        }

        // 2.2 Data License
        if ($('#dataLicense').val().trim() == '') {
            documentCreationInformationObj['dataLicense'] = 'CC0-1.0';
        } else {
            documentCreationInformationObj['dataLicense'] = $('#dataLicense').val().trim();
        }

        // 2.3 SPDX Identifier
        if ($('#spdxIdentifier').val().trim() == '') {
            documentCreationInformationObj['SPDXID'] = 'SPDXRef-DOCUMENT';
        } else {
            documentCreationInformationObj['SPDXID'] = 'SPDXRef-' + $('#spdxIdentifier').val().trim();
        }

        // 2.4 Document Name
        documentCreationInformationObj['name'] = $('#documentName').val().trim();

        // 2.5 SPDX Document Namespace
        documentCreationInformationObj['documentNamespace'] = $('#documentNamespace').val().trim();

        // 2.6 External Document References: auto

        // 2.7 License List Version
        documentCreationInformationObj['licenseListVersion'] = $('#licenseListVersion').val().trim();

        // 2.8 Creator
        documentCreationInformationObj.creator = [];
        $('[name=creatorRow]').each(function() {
            if ($(this).find('.creator-type').first().attr('disabled')) {
                return;
            }

            let creatorType = $(this).find('.creator-type').first().val().trim();
            let creatorValue = $(this).find('.creator-value').first().val().trim();

            if (creatorValue != '') {
                documentCreationInformationObj.creator.push({ 'type': creatorType, 'value': creatorValue });
            }
        })

        if (documentCreationInformationObj.creator.length == 0) {
            // Fill the current user of SW360
        }

        // 2.9 Created
        documentCreationInformationObj['created'] = readDateTime('#createdDate', '#createdTime');
        if (documentCreationInformationObj['created'] == '') {
            documentCreationInformationObj['created'] = (new Date()).toISOString();
        }
    }
</script>