select
    p.event_id as event_id,
    p.customer_id as customer_id,
    p.segment_id as segment_id,
    p.v5 * 11 as v1,
    round(p.v2 / 2.0, 4) as v2,
    p.v5 * 3 as v3,
    p.v2 - p.v5 as v4,
    case when p.v2 > 1100 then p.v2 else 0 end as v5,
    coalesce(p.v2, 0) + 13 as v6,
    p.v5 + 5 as v7
from {{ ref('int_ev_0003') }} as p
