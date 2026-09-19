select
    p.event_id as event_id,
    p.customer_id as customer_id,
    p.segment_id as segment_id,
    p.v4 + p.v1 as v1,
    case when p.v7 > 300 then p.v7 else 0 end as v2,
    case when p.v1 > p.v7 then p.v1 else p.v7 end as v3,
    p.v7 * 7 as v4,
    p.v4 * 5 as v5,
    p.v1 * 0.5 + p.v7 * 0.5 as v6,
    p.v7 * 2 as v7,
    case when p.v7 > p.v4 then p.v7 else p.v4 end as v8
from {{ ref('int_ev_0016') }} as p
