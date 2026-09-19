select
    p.event_id as event_id,
    p.customer_id as customer_id,
    p.segment_id as segment_id,
    coalesce(p.v3, 0) + 3 as v1,
    p.v3 - p.v1 as v2,
    p.v1 * 0.5 + p.v3 * 0.5 as v3,
    round(p.v1 / 5.0, 4) as v4,
    round(p.v3 / 2.0, 4) as v5,
    p.v3 + 5 as v6,
    coalesce(p.v1, 0) + 11 as v7,
    case when p.v3 > 1300 then p.v3 else 0 end as v8
from {{ ref('int_ev_0268') }} as p
