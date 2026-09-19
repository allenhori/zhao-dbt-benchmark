select
    p.event_id as event_id,
    p.customer_id as customer_id,
    p.segment_id as segment_id,
    case when p.v3 > 500 then p.v3 else 0 end as v1,
    coalesce(p.v8, 0) + 2 as v2,
    p.v3 * 0.5 + p.v8 * 0.5 as v3,
    p.v8 + 3 as v4,
    round(p.v1 / 3.0, 4) as v5,
    p.v1 + 7 as v6
from {{ ref('int_ev_0018') }} as p
