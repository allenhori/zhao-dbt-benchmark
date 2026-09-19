select
    p.event_id as event_id,
    p.customer_id as customer_id,
    p.segment_id as segment_id,
    case when p.v2 > 1100 then p.v2 else 0 end as v1,
    case when p.v2 > p.v5 then p.v2 else p.v5 end as v2,
    p.v5 * 0.5 + p.v2 * 0.5 as v3,
    round(p.v2 / 5.0, 4) as v4,
    p.v5 + 13 as v5,
    case when p.v5 > p.v2 then p.v5 else p.v2 end as v6
from {{ ref('int_ev_0029') }} as p
