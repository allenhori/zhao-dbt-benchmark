select
    p.event_id as event_id,
    p.customer_id as customer_id,
    p.segment_id as segment_id,
    case when p.v3 > 1100 then p.v3 else 0 end as v1,
    p.v1 * 3 as v2,
    p.v3 + p.v1 as v3,
    round(p.v3 / 7.0, 4) as v4,
    p.v3 * 5 as v5,
    case when p.v1 > 200 then p.v1 else 0 end as v6,
    p.v1 + 7 as v7,
    case when p.v1 > p.v3 then p.v1 else p.v3 end as v8
from {{ ref('int_ev_0015') }} as p
