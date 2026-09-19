select
    p.event_id as event_id,
    p.customer_id as customer_id,
    p.segment_id as segment_id,
    case when p.v1 > 200 then p.v1 else 0 end as v1,
    p.v3 + p.v1 as v2,
    p.v1 + 7 as v3,
    case when p.v3 > p.v1 then p.v3 else p.v1 end as v4,
    p.v1 + p.v3 as v5,
    p.v3 * 11 as v6,
    coalesce(p.v1, 0) + 2 as v7,
    p.v3 - p.v1 as v8
from {{ ref('int_ev_0123') }} as p
