select
    p.event_id as event_id,
    p.customer_id as customer_id,
    p.segment_id as segment_id,
    case when p.v2 > 300 then p.v2 else 0 end as v1,
    coalesce(p.v1, 0) + 13 as v2,
    p.v5 * 2 as v3,
    round(p.v1 / 7.0, 4) as v4,
    coalesce(p.v1, 0) + 3 as v5,
    p.v2 + 5 as v6
from {{ ref('int_ev_0118') }} as p
