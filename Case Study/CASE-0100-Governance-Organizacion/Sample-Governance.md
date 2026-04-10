```markdown
graph TD

%% =======================
%% TENANT
%% =======================
T[Tenant: Microsoft Entra ID]

%% =======================
%% GOVERNANCE LAYER
%% =======================
T --> MG[Management Groups]

MG --> MG_PLATFORM[MG: Platform]
MG --> MG_LZ[MG: Landing Zones]

%% =======================
%% PLATFORM SUBSCRIPTIONS
%% =======================
MG_PLATFORM --> SUB_ID[Subscription: identity-sub]
SUB_ID --> RG_ID[RG: identity-services]
RG_ID --> AADDS[Azure AD Domain Services]
RG_ID --> VNET_ID[Identity VNet]

MG_PLATFORM --> SUB_NET[Subscription: network-sub]
SUB_NET --> RG_NET[RG: hub-network]
RG_NET --> HUB[Hub VNet]
RG_NET --> FW[Azure Firewall]
RG_NET --> VPN[VPN Gateway]

MG_PLATFORM --> SUB_MGMT[Subscription: management-sub]
SUB_MGMT --> RG_MGMT[RG: observability]
RG_MGMT --> LAW[Log Analytics]
RG_MGMT --> AI[Application Insights]

%% =======================
%% LANDING ZONES
%% =======================
MG_LZ --> MG_SALES[MG: Sales]
MG_LZ --> MG_FIN[MG: Finance]

%% =======================
%% SALES
%% =======================
MG_SALES --> SUB_SALES_DEV[Subscription: sales-dev]
SUB_SALES_DEV --> RG_SALES_DEV[RG: sales-app-dev]
RG_SALES_DEV --> APP_DEV[App Service DEV]
RG_SALES_DEV --> KV_DEV[Key Vault DEV]

MG_SALES --> SUB_SALES_PROD[Subscription: sales-prod]
SUB_SALES_PROD --> RG_SALES_PROD[RG: sales-app-prod]
RG_SALES_PROD --> APP_PROD[App Service PROD]
RG_SALES_PROD --> SQL_PROD[Azure SQL PROD]

%% =======================
%% FINANCE
%% =======================
MG_FIN --> SUB_FIN_PROD[Subscription: finance-prod]
SUB_FIN_PROD --> RG_FIN_PROD[RG: finance-app-prod]
RG_FIN_PROD --> APP_FIN[App Service PROD]
RG_FIN_PROD --> SQL_FIN[Azure SQL PROD]
```
