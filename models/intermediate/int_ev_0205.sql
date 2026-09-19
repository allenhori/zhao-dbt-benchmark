select
    p.event_id as event_id,
    p.customer_id as customer_id,
    p.segment_id as segment_id,
    case when p.v1 > 300 then p.v1 else 0 end as v1,
    coalesce(p.v6, 0) + 11 as v2,
    p.v6 * 13 as v3,
    p.v1 + 3 as v4,
    case when p.v1 > 500 then p.v1 else 0 end as v5,
    p.v6 + 2 as v6,
    p.v6 * 0.5 + p.v1 * 0.5 as v7,
    case when p.v6 > 300 then p.v6 else 0 end as v8
from {{ ref('int_ev_0203') }} as p
