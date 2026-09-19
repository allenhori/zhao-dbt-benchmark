select
    p.event_id as event_id,
    p.customer_id as customer_id,
    p.segment_id as segment_id,
    p.v5 * 7 as v1,
    p.v3 * 5 as v2,
    p.v3 + 5 as v3,
    round(p.v5 / 13.0, 4) as v4,
    p.v5 * 0.5 + p.v3 * 0.5 as v5,
    p.v3 + 7 as v6
from {{ ref('int_ev_0019') }} as p
where p.customer_id % 97 <> 0
