select
    p.event_id as event_id,
    p.customer_id as customer_id,
    p.segment_id as segment_id,
    p.v3 + 11 as v1,
    p.v3 + 2 as v2,
    p.v5 - p.v3 as v3,
    round(p.v5 / 11.0, 4) as v4,
    p.v3 + p.v5 as v5,
    round(p.v3 / 2.0, 4) as v6,
    p.v5 + 2 as v7,
    p.v5 * 5 as v8
from {{ ref('int_ev_0195') }} as p
where p.customer_id % 97 <> 0
