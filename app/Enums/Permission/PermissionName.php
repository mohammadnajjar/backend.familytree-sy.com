<?php

namespace App\Enums\Permission;

use App\Enums\Base\EnumToArray;

enum PermissionName: string
{
    use EnumToArray;

    // <editor-fold default-state="collapsed" desc="General Permissions">
    case CAN_VIEW_GENERAL_SETTINGS = 'can_view_general_settings';
    case CAN_UPDATE_GENERAL_SETTINGS = 'can_update_general_settings';
    case CAN_VIEW_MEMBER_STATS = 'can_view_member_statistic';
    case CAN_VIEW_ADMIN_STATS = 'can_view_admin_statistic';
    // </editor-fold>

    // <editor-fold default-state="collapsed" desc="Permissions Management">
    case CAN_CREATE_PERMISSIONS = 'can_create_permissions';
    case CAN_VIEW_ALL_PERMISSIONS = 'can_view_all_permissions';
    case CAN_VIEW_PERMISSIONS = 'can_view_permissions';
    case CAN_UPDATE_PERMISSIONS = 'can_update_permissions';
    case CAN_DELETE_PERMISSIONS = 'can_delete_permissions';
    // </editor-fold>

    // <editor-fold default-state="collapsed" desc="Media">
    case CAN_CREATE_MEDIA = 'can_create_media';
    case CAN_VIEW_ALL_MEDIA = 'can_view_all_media';
    case CAN_VIEW_MEDIA = 'can_view_media';
    case CAN_UPDATE_MEDIA = 'can_update_media';
    case CAN_DELETE_MEDIA = 'can_delete_media';
    // </editor-fold>

    // <editor-fold default-state="collapsed" desc="Members">
    case CAN_CREATE_MEMBERS = 'can_create_members';
    case CAN_VIEW_ALL_MEMBERS = 'can_view_all_members';
    case CAN_VIEW_MEMBERS = 'can_view_members';
    case CAN_UPDATE_MEMBERS = 'can_update_members';
    case CAN_DELETE_MEMBERS = 'can_delete_members';
    // </editor-fold>

    // <editor-fold default-state="collapsed" desc="Cities">
    case CAN_CREATE_CITIES = 'can_create_cities';
    case CAN_VIEW_ALL_CITIES = 'can_view_all_cities';
    case CAN_VIEW_CITIES = 'can_view_cities';
    case CAN_UPDATE_CITIES = 'can_update_cities';
    case CAN_DELETE_CITIES = 'can_delete_cities';
    // </editor-fold>

    // <editor-fold default-state="collapsed" desc="Nodes">
    case CAN_CREATE_NODES = 'can_create_nodes';
    case CAN_VIEW_ALL_NODES = 'can_view_all_nodes';
    case CAN_VIEW_NODES = 'can_view_nodes';
    case CAN_UPDATE_NODES = 'can_update_nodes';
    case CAN_DELETE_NODES = 'can_delete_nodes';
    // </editor-fold>

    // <editor-fold default-state="collapsed" desc="Join Request Reviews">
    case CAN_CREATE_JOIN_REQUEST_REVIEWS = 'can_create_join_request_reviews';
    case CAN_VIEW_ALL_JOIN_REQUEST_REVIEWS = 'can_view_all_join_request_reviews';
    case CAN_VIEW_JOIN_REQUEST_REVIEWS = 'can_view_join_request_reviews';
    case CAN_UPDATE_JOIN_REQUEST_REVIEWS = 'can_update_join_request_reviews';
    case CAN_DELETE_JOIN_REQUEST_REVIEWS = 'can_delete_join_request_reviews';
    // </editor-fold>

    // <editor-fold default-state="collapsed" desc="Historical Events">
    case CAN_CREATE_HISTORICAL_EVENTS = 'can_create_historical_events';
    case CAN_VIEW_ALL_HISTORICAL_EVENTS = 'can_view_all_historical_events';
    case CAN_VIEW_HISTORICAL_EVENTS = 'can_view_historical_events';
    case CAN_UPDATE_HISTORICAL_EVENTS = 'can_update_historical_events';
    case CAN_DELETE_HISTORICAL_EVENTS = 'can_delete_historical_events';
    // </editor-fold>

    // <editor-fold default-state="collapsed" desc="Achievements">
    case CAN_CREATE_ACHIEVEMENTS = 'can_create_achievements';
    case CAN_VIEW_ALL_ACHIEVEMENTS = 'can_view_all_achievements';
    case CAN_VIEW_ACHIEVEMENTS = 'can_view_achievements';
    case CAN_UPDATE_ACHIEVEMENTS = 'can_update_achievements';
    case CAN_DELETE_ACHIEVEMENTS = 'can_delete_achievements';
    // </editor-fold>

    // <editor-fold default-state="collapsed" desc="Photographs">
    case CAN_CREATE_PHOTOGRAPHS = 'can_create_photographs';
    case CAN_VIEW_ALL_PHOTOGRAPHS = 'can_view_all_photographs';
    case CAN_VIEW_PHOTOGRAPHS = 'can_view_photographs';
    case CAN_UPDATE_PHOTOGRAPHS = 'can_update_photographs';
    case CAN_DELETE_PHOTOGRAPHS = 'can_delete_photographs';
    // </editor-fold>

    // <editor-fold default-state="collapsed" desc="Committees">
    case CAN_CREATE_COMMITTEES = 'can_create_committees';
    case CAN_VIEW_ALL_COMMITTEES = 'can_view_all_committees';
    case CAN_VIEW_COMMITTEES = 'can_view_committees';
    case CAN_UPDATE_COMMITTEES = 'can_update_committees';
    case CAN_DELETE_COMMITTEES = 'can_delete_committees';
    // </editor-fold>

    // <editor-fold default-state="collapsed" desc="Donations">
    case CAN_CREATE_DONATIONS = 'can_create_donations';
    case CAN_VIEW_ALL_DONATIONS = 'can_view_all_donations';
    case CAN_VIEW_DONATIONS = 'can_view_donations';
    case CAN_UPDATE_DONATIONS = 'can_update_donations';
    case CAN_DELETE_DONATIONS = 'can_delete_donations';
    // </editor-fold>

    // <editor-fold default-state="collapsed" desc="Committee Events">
    case CAN_CREATE_COMMITTEE_EVENTS = 'can_create_committee_events';
    case CAN_VIEW_ALL_COMMITTEE_EVENTS = 'can_view_all_committee_events';
    case CAN_VIEW_COMMITTEE_EVENTS = 'can_view_committee_events';
    case CAN_UPDATE_COMMITTEE_EVENTS = 'can_update_committee_events';
    case CAN_DELETE_COMMITTEE_EVENTS = 'can_delete_committee_events';
    // </editor-fold>

    // <editor-fold default-state="collapsed" desc="Committee Events">
    case CAN_CREATE_JOIN_REQUESTS = 'can_create_join_requests';
    case CAN_VIEW_ALL_JOIN_REQUESTS = 'can_view_all_join_requests';
    case CAN_VIEW_JOIN_REQUESTS = 'can_view_join_requests';
    case CAN_UPDATE_JOIN_REQUESTS = 'can_update_join_requests';
    case CAN_DELETE_JOIN_REQUESTS = 'can_delete_join_requests';
    // </editor-fold>

    // <editor-fold default-state="collapsed" desc="Users Management">
    case CAN_CREATE_USERS = 'can_create_users';
    case CAN_VIEW_ALL_USERS = 'can_view_all_users';
    case CAN_VIEW_USERS = 'can_view_users';
    case CAN_UPDATE_USERS = 'can_update_users';
    case CAN_DELETE_USERS = 'can_delete_users';
    // </editor-fold>
}
