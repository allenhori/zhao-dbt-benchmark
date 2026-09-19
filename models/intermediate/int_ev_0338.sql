select
    p.event_id as event_id,
    p.customer_id as customer_id,
    p.segment_id as segment_id,
    p.v5 + 2 as v1,
    coalesce(p.v3, 0) + 11 as v2,
    p.v3 * 0.5 + p.v4 * 0.5 as v3,
    case when p.v5 > p.v4 then p.v5 else p.v4 end as v4,
    round(p.v5 / 5.0, 4) as v5,
    round(p.v4 / 3.0, 4) as v6,
    p.v5 + p.v3 as v7
from {{ ref('int_ev_0328') }} as p
