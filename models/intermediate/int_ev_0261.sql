select
    p.event_id as event_id,
    p.customer_id as customer_id,
    p.segment_id as segment_id,
    p.v7 + p.v6 as v1,
    p.v6 * 0.5 + p.v7 * 0.5 as v2,
    p.v6 * 2 as v3,
    p.v7 + p.v6 as v4,
    case when p.v7 > p.v6 then p.v7 else p.v6 end as v5,
    round(p.v6 / 7.0, 4) as v6
from {{ ref('int_ev_0019') }} as p
