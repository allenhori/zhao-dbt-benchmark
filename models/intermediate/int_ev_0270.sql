select
    p.event_id as event_id,
    p.customer_id as customer_id,
    p.segment_id as segment_id,
    p.v5 + p.v3 as v1,
    p.v5 + p.v3 as v2,
    coalesce(p.v3, 0) + 5 as v3,
    p.v3 * 13 as v4,
    round(p.v3 / 11.0, 4) as v5,
    coalesce(p.v5, 0) + 3 as v6
from {{ ref('int_ev_0209') }} as p
where p.customer_id % 97 <> 0
