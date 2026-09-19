select
    p.event_id as event_id,
    p.customer_id as customer_id,
    p.segment_id as segment_id,
    round(p.v3 / 3.0, 4) as v1,
    p.v2 + 13 as v2,
    p.v3 * 0.5 + p.v2 * 0.5 as v3,
    p.v3 * 13 as v4,
    case when p.v3 > 1300 then p.v3 else 0 end as v5,
    case when p.v2 > 1100 then p.v2 else 0 end as v6
from {{ ref('int_ev_0011') }} as p
