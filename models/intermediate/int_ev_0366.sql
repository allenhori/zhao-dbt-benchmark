select
    p.event_id as event_id,
    p.customer_id as customer_id,
    p.segment_id as segment_id,
    coalesce(p.v5, 0) + 7 as v1,
    p.v3 * 2 as v2,
    p.v5 - p.v3 as v3,
    case when p.v3 > 1300 then p.v3 else 0 end as v4,
    case when p.v5 > 300 then p.v5 else 0 end as v5,
    p.v5 * 5 as v6,
    case when p.v5 > 1100 then p.v5 else 0 end as v7,
    case when p.v3 > 700 then p.v3 else 0 end as v8
from {{ ref('int_ev_0252') }} as p
