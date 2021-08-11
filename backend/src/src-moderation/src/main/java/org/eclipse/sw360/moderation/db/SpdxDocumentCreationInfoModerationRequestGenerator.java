/*
 * Copyright Toshiba corporation, 2021. Part of the SW360 Portal Project.
 * Copyright Toshiba Software Development (Vietnam) Co., Ltd., 2021. Part of the SW360 Portal Project.
 *
 * This program and the accompanying materials are made
 * available under the terms of the Eclipse Public License 2.0
 * which is available at https://www.eclipse.org/legal/epl-2.0/
 *
 * SPDX-License-Identifier: EPL-2.0
 */
package org.eclipse.sw360.moderation.db;

import org.eclipse.sw360.datahandler.thrift.spdx.documentcreationinformation.DocumentCreationInformation;
import org.eclipse.sw360.datahandler.thrift.moderation.ModerationRequest;

/**
 * Class for comparing a document with its counterpart in the database
 * Writes the difference (= additions and deletions) to the moderation request
 *
 * @author hieu1.phamvan@toshiba.co.jp
 */

public class SpdxDocumentCreationInfoModerationRequestGenerator extends ModerationRequestGenerator<DocumentCreationInformation._Fields, DocumentCreationInformation> {
    @Override
    public ModerationRequest setAdditionsAndDeletions(ModerationRequest request, DocumentCreationInformation updateDocument, DocumentCreationInformation actualDocument){

        documentAdditions = new DocumentCreationInformation();
        documentDeletions = new DocumentCreationInformation();
        //required fields:
        documentAdditions.setId(updateDocument.getId());
        documentDeletions.setId(actualDocument.getId());

        for (DocumentCreationInformation._Fields field : DocumentCreationInformation._Fields.values()) {

            if(actualDocument.getFieldValue(field) == null){
                    documentAdditions.setFieldValue(field, updateDocument.getFieldValue(field));
            } else if (updateDocument.getFieldValue(field) == null){
                    documentDeletions.setFieldValue(field, actualDocument.getFieldValue(field));
            } else if(!actualDocument.getFieldValue(field).equals(updateDocument.getFieldValue(field))) {
                switch (field) {
                    case REVISION:
                    case TYPE:
                    case PERMISSIONS:
                    case DOCUMENT_STATE:
                    case SPDX_DOCUMENT_ID:
                        break;
                    case DOCUMENT_CREATION_INFORMATION_ID:
                    case DATA_LICENSE:
                    case NAME:
                    case DOCUMENT_NAMESPACE:
                    case EXTERNAL_DOCUMENT_REFS:
                    case LICENSE_LIST_VERSION:
                    case CREATOR:
                    case CREATED:
                    case CREATOR_COMMENT:
                    case DOCUMENT_COMMENT:
                    default:
                        dealWithBaseTypes(field, DocumentCreationInformation.metaDataMap.get(field));
                }
            }
        }
        request.setDocumentCreationInfoAdditions(documentAdditions);
        request.setDocumentCreationInfoDeletions(documentDeletions);
        return request;
    }
}
