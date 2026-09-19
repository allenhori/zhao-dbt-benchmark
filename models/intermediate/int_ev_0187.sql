select
    p.event_id as event_id,
    p.customer_id as customer_id,
    p.segment_id as segment_id,
    coalesce(p.v2, 0) + 13 as v1,
    round(p.v2 / 3.0, 4) as v2,
    case when p.v3 > 1100 then p.v3 else 0 end as v3,
    p.v3 - p.v2 as v4,
    p.v3 * 11 as v5,
    coalesce(p.v3, 0) + 13 as v6
from {{ ref('int_ev_0029') }} as p
