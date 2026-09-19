select
    p.event_id as event_id,
    p.customer_id as customer_id,
    p.segment_id as segment_id,
    round(p.v2 / 3.0, 4) as v1,
    p.v2 + p.v4 as v2,
    coalesce(p.v2, 0) + 3 as v3,
    case when p.v2 > p.v4 then p.v2 else p.v4 end as v4,
    p.v4 * 13 as v5,
    p.v4 * 0.5 + p.v2 * 0.5 as v6
from {{ ref('int_ev_0127') }} as p
