select
    p.event_id as event_id,
    p.customer_id as customer_id,
    p.segment_id as segment_id,
    p.v5 * 0.5 + p.v6 * 0.5 as v1,
    p.v5 + 2 as v2,
    round(p.v5 / 11.0, 4) as v3,
    p.v1 + p.v6 as v4,
    coalesce(p.v6, 0) + 2 as v5,
    p.v6 + 5 as v6
from {{ ref('int_ev_0008') }} as p
where p.customer_id % 97 <> 0
