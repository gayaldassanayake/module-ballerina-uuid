// Copyright (c) 2020 WSO2 Inc. (http://www.wso2.org) All Rights Reserved.
//
// WSO2 Inc. licenses this file to you under the Apache License,
// Version 2.0 (the "License"); you may not use this file except
// in compliance with the License.
// You may obtain a copy of the License at
//
// http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing,
// software distributed under the License is distributed on an
// "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
// KIND, either express or implied.  See the License for the
// specific language governing permissions and limitations
// under the License.

import ballerina/test;

@test:Config {}
isolated function testCreateType1AsString() {
    test:assertEquals(createType1AsString().length(), 36);
}

@test:Config {}
isolated function testCreateType1AsRecord() {
    test:assertTrue(createType1AsRecord() is UUID);
}

@test:Config {}
isolated function testCreateType3AsString() {
    test:assertEquals(createType3AsString(NameSpaceDNS, "python.org"), "6fa459ea-ee8a-3ca4-894e-db77e160355e");
}

@test:Config {}
isolated function testCreateType4AsString() {
    test:assertEquals(createType4AsString().length(), 36);
}

@test:Config {}
isolated function testCreateType5AsString() {
    test:assertEquals(createType5AsString(NameSpaceDNS, "python.org"), "886313e1-3b8a-5372-9b90-0c9aee199e5d");
}

@test:Config {}
isolated function testNilAsString() {
    test:assertEquals(nilAsString(), "00000000-0000-0000-0000-000000000000");
}

@test:Config {}
isolated function testValidate() {
    test:assertTrue(validate("4397465e-35f9-11eb-adc1-0242ac120002"));
}

@test:Config {}
isolated function testUuidVersion() {
    test:assertEquals(uuidVersion("4397465e-35f9-11eb-adc1-0242ac120002"), V1);
    test:assertEquals(uuidVersion("6fa459ea-ee8a-3ca4-894e-db77e160355e"), V3);
    test:assertEquals(uuidVersion("66a9f41f-4066-46d1-a838-51952fe64ff3"), V4);
    test:assertEquals(uuidVersion("886313e1-3b8a-5372-9b90-0c9aee199e5d"), V5);
}

@test:Config {}
isolated function testToRecord() {
    UUID expcectedUUID = {
        timeLow: 1133987422,
        timeMid: 13817,
        timeHiAndVersion: 4587,
        clockSeqHiAndReserved: 173,
        clockSeqLo: 193,
        node: 2485377957890
    };
    test:assertEquals(toRecord("4397465e-35f9-11eb-adc1-0242ac120002"), expcectedUUID);
}
