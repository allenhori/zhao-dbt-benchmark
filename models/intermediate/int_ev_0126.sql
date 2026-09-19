select
    p.event_id as event_id,
    p.customer_id as customer_id,
    p.segment_id as segment_id,
    round(p.v7 / 11.0, 4) as v1,
    round(p.v8 / 3.0, 4) as v2,
    p.v8 * 0.5 + p.v7 * 0.5 as v3,
    case when p.v8 > 200 then p.v8 else 0 end as v4,
    p.v8 + 13 as v5,
    case when p.v7 > 300 then p.v7 else 0 end as v6,
    case when p.v7 > p.v8 then p.v7 else p.v8 end as v7,
    p.v8 * 0.5 + p.v7 * 0.5 as v8
from {{ ref('int_ev_0118') }} as p
