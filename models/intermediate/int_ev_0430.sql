select
    p.event_id as event_id,
    p.customer_id as customer_id,
    p.segment_id as segment_id,
    round(p.v1 / 7.0, 4) as v1,
    p.v1 - p.v7 as v2,
    p.v1 + 5 as v3,
    p.v7 * 3 as v4,
    p.v1 + 7 as v5,
    case when p.v1 > p.v7 then p.v1 else p.v7 end as v6,
    p.v7 + p.v1 as v7
from {{ ref('int_ev_0016') }} as p
