select
    p.event_id as event_id,
    p.customer_id as customer_id,
    p.segment_id as segment_id,
    round(p.v4 / 5.0, 4) as v1,
    p.v3 + 2 as v2,
    p.v3 * 0.5 + p.v1 * 0.5 as v3,
    coalesce(p.v1, 0) + 11 as v4,
    p.v3 + 2 as v5,
    case when p.v3 > p.v1 then p.v3 else p.v1 end as v6
from {{ ref('int_ev_0061') }} as p
