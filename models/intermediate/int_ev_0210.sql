select
    p.event_id as event_id,
    p.customer_id as customer_id,
    p.segment_id as segment_id,
    coalesce(p.v4, 0) + 13 as v1,
    case when p.v2 > p.v4 then p.v2 else p.v4 end as v2,
    p.v4 + p.v5 as v3,
    round(p.v5 / 11.0, 4) as v4,
    p.v4 * 0.5 + p.v2 * 0.5 as v5,
    case when p.v2 > p.v5 then p.v2 else p.v5 end as v6
from {{ ref('int_ev_0019') }} as p
