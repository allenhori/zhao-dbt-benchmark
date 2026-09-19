select
    p.event_id as event_id,
    p.customer_id as customer_id,
    p.segment_id as segment_id,
    p.v3 + p.v4 as v1,
    p.v3 - p.v4 as v2,
    p.v4 * 3 as v3,
    round(p.v4 / 5.0, 4) as v4,
    round(p.v3 / 11.0, 4) as v5,
    p.v3 * 7 as v6,
    case when p.v4 > p.v3 then p.v4 else p.v3 end as v7,
    p.v3 * 0.5 + p.v4 * 0.5 as v8
from {{ ref('int_ev_0147') }} as p
