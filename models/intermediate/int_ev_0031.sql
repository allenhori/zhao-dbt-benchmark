select
    p.event_id as event_id,
    p.customer_id as customer_id,
    p.segment_id as segment_id,
    p.v4 * 7 as v1,
    case when p.v7 > 300 then p.v7 else 0 end as v2,
    p.v3 * 7 as v3,
    round(p.v4 / 7.0, 4) as v4,
    coalesce(p.v3, 0) + 5 as v5,
    p.v4 * 5 as v6,
    p.v3 - p.v7 as v7,
    case when p.v3 > p.v7 then p.v3 else p.v7 end as v8
from {{ ref('int_ev_0009') }} as p
