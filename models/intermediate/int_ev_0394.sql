select
    p.event_id as event_id,
    p.customer_id as customer_id,
    p.segment_id as segment_id,
    p.v2 + 11 as v1,
    p.v2 * 2 as v2,
    case when p.v4 > 1100 then p.v4 else 0 end as v3,
    p.v4 * 0.5 + p.v2 * 0.5 as v4,
    round(p.v2 / 7.0, 4) as v5,
    p.v2 + 5 as v6
from {{ ref('int_ev_0029') }} as p
