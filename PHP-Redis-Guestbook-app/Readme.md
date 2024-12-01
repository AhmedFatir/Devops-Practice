# PHP-Redis Guestbook Application

## Overview

The **PHP-Redis Guestbook Application** is a simple, scalable web application that allows users to submit and view messages in a guestbook. It is built using a PHP-based frontend and a Redis backend. This application is containerized and orchestrated using Kubernetes, providing high availability and scalability.

## Architecture

The application is composed of three main components:

1. **Frontend**:
   - A PHP-based web application that serves the guestbook UI.
   - Runs as a Kubernetes Deployment with 3 replicas for load balancing and high availability.
   - Exposed via a LoadBalancer Service on port 80.

2. **Redis Leader**:
   - The primary Redis instance responsible for handling write operations.
   - Runs as a single-replica Kubernetes Deployment.
   - Exposed via a ClusterIP Service on port 6379.

3. **Redis Followers**:
   - Redis instances that replicate data from the leader and handle read operations.
   - Runs as a Kubernetes Deployment with 2 replicas for redundancy and scalability.
   - Exposed via a ClusterIP Service on port 6379.

## Kubernetes Resources

### Frontend Deployment (`frontend.yml`)

- **Deployment**:
  - 3 replicas of the PHP-Redis frontend container.
  - Resource limits: 128Mi memory, 500m CPU.
- **Service**:
  - Exposes the frontend Deployment via a LoadBalancer on port 80.
  - Ensures external accessibility of the guestbook UI.

### Redis Leader Deployment (`redis-leader.yml`)

- **Deployment**:
  - 1 replica of the Redis leader instance.
  - Resource limits: 128Mi memory, 500m CPU.
- **Service**:
  - Exposes the Redis leader via a ClusterIP on port 6379.
  - Internal communication within the cluster for write operations.

### Redis Follower Deployment (`redis-follower.yml`)

- **Deployment**:
  - 2 replicas of the Redis follower instance.
  - Resource limits: 128Mi memory, 500m CPU.
- **Service**:
  - Exposes Redis followers via a ClusterIP on port 6379.
  - Handles internal cluster read operations.

## Prerequisites

- A Kubernetes cluster.
- `kubectl` installed and configured.
- An external load balancer (for the frontend Service).

## Deployment Instructions

1. **Deploy the App**:
```bash
kubectl apply -f redis-leader.yml -f redis-follower.yml -f frontend.yml
```
2. **Verify the Deployments**:
```bash
kubectl get deployments
kubectl get services
```
3. **Check the status of pods**:
```bash
kubectl get pods
```
4. **Cleaning up**:
```bash
kubectl delete -f redis-leader.yml -f redis-follower.yml -f frontend.yml
```

