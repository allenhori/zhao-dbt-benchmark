select
    p.event_id as event_id,
    p.customer_id as customer_id,
    p.segment_id as segment_id,
    p.v2 * 0.5 + p.v3 * 0.5 as v1,
    round(p.v3 / 5.0, 4) as v2,
    round(p.v2 / 3.0, 4) as v3,
    p.v2 + 5 as v4,
    p.v2 + 2 as v5,
    p.v3 + p.v2 as v6
from {{ ref('int_ev_0364') }} as p
where p.customer_id % 97 <> 0
