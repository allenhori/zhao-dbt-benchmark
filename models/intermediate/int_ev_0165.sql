select
    p.event_id as event_id,
    p.customer_id as customer_id,
    p.segment_id as segment_id,
    coalesce(p.v5, 0) + 13 as v1,
    p.v5 + p.v2 as v2,
    p.v2 * 2 as v3,
    p.v2 * 0.5 + p.v5 * 0.5 as v4,
    p.v2 - p.v5 as v5,
    p.v2 * 13 as v6
from {{ ref('int_ev_0012') }} as p
where p.customer_id % 97 <> 0
