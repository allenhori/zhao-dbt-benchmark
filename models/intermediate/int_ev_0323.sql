select
    p.event_id as event_id,
    p.customer_id as customer_id,
    p.segment_id as segment_id,
    p.v2 * 7 as v1,
    p.v1 * 2 as v2,
    coalesce(p.v1, 0) + 5 as v3,
    p.v1 * 5 as v4,
    coalesce(p.v2, 0) + 13 as v5,
    case when p.v1 > p.v2 then p.v1 else p.v2 end as v6,
    case when p.v2 > p.v1 then p.v2 else p.v1 end as v7,
    p.v1 + p.v2 as v8
from {{ ref('int_ev_0006') }} as p
