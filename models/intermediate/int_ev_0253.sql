select
    p.event_id as event_id,
    p.customer_id as customer_id,
    p.segment_id as segment_id,
    case when p.v2 > 200 then p.v2 else 0 end as v1,
    coalesce(p.v2, 0) + 5 as v2,
    case when p.v2 > 1100 then p.v2 else 0 end as v3,
    p.v1 + p.v2 as v4,
    case when p.v1 > 200 then p.v1 else 0 end as v5,
    case when p.v1 > p.v2 then p.v1 else p.v2 end as v6,
    p.v2 - p.v1 as v7,
    case when p.v2 > p.v1 then p.v2 else p.v1 end as v8
from {{ ref('int_ev_0089') }} as p
