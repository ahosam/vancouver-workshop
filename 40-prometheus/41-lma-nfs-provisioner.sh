#!/bin/bash

# Copyright 2017 The Openstack-Helm Authors.
#
#    Licensed under the Apache License, Version 2.0 (the "License"); you may
#    not use this file except in compliance with the License. You may obtain
#    a copy of the License at
#
#         http://www.apache.org/licenses/LICENSE-2.0
#
#    Unless required by applicable law or agreed to in writing, software
#    distributed under the License is distributed on an "AS IS" BASIS, WITHOUT
#    WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the
#    License for the specific language governing permissions and limitations
#    under the License.

set -xe

WORK_DIR=/opt/openstack-helm-infra
VALUES_DIR=/opt/vancouver-workshop/40-prometheus/override-files
helm upgrade --install lma-nfs-provisioner \
    ${WORK_DIR}/nfs-provisioner --namespace=openstack \
    --values=${VALUES_DIR}/lma-nfs-provisioner.yaml

#NOTE: Wait for deployment
bash /opt/vancouver-workshop/90-common/wait-for-pods.sh openstack

#NOTE: Validate Deployment info
helm status lma-nfs-provisioner
