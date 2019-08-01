import request from '@/router/axios'

export function fetchList (query) {
  return request({
    url: '/quartz/job/page',
    method: 'get',
    params: query
  })
}

export function addObj (obj) {
  return request({
    url: '/quartz/job',
    method: 'post',
    data: obj
  })
}

export function getObj (id) {
  return request({
    url: '/quartz/job/' + id,
    method: 'get'
  })
}

export function delObj (id) {
  return request({
    url: '/quartz/job/' + id,
    method: 'delete'
  })
}

export function putObj (obj) {
  return request({
    url: '/quartz/job',
    method: 'put',
    data: obj
  })
}

export function validJobName(jobName,jobGroup) {
  return request({
    url: '/quartz/job/is-valid-task-name',
    method: 'get',
    params: {
      jobName: jobName,
      jobGroup: jobGroup
    }
  })
}

export function startJob(id) {
  return request({
    url: '/quartz/job/start-job/' + id,
    method: 'post'
  })
}

export function pauseJob(id) {
  return request({
    url: '/quartz/job/shutdown-job/' + id,
    method: 'post'
  })
}
export function startAll(){
  return request({
    url: '/quartz/job/start-jobs',
    method: 'post'
  })
}
export function pauseAll() {
  return request({
    url: '/quartz/job/shutdown-jobs',
    method: 'post'
  })
}

export function refreshAll() {
  return request({
    url: '/quartz/job/refresh-jobs',
    method: 'post'
  })
}

export function jobLog(query){
  return request({
    url: '/quartz/job/job-log',
    method: 'get',
    params: query
  })
}