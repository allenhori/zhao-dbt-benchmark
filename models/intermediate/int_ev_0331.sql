select
    p.event_id as event_id,
    p.customer_id as customer_id,
    p.segment_id as segment_id,
    coalesce(p.v5, 0) + 13 as v1,
    p.v1 - p.v3 as v2,
    case when p.v1 > 200 then p.v1 else 0 end as v3,
    case when p.v1 > 500 then p.v1 else 0 end as v4,
    case when p.v3 > 300 then p.v3 else 0 end as v5,
    round(p.v1 / 2.0, 4) as v6,
    case when p.v3 > 200 then p.v3 else 0 end as v7
from {{ ref('int_ev_0176') }} as p
