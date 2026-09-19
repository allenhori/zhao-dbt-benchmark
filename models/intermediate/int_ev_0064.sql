select
    p.event_id as event_id,
    p.customer_id as customer_id,
    p.segment_id as segment_id,
    p.v6 + p.v2 as v1,
    case when p.v6 > 200 then p.v6 else 0 end as v2,
    p.v6 * 0.5 + p.v2 * 0.5 as v3,
    case when p.v2 > 700 then p.v2 else 0 end as v4,
    coalesce(p.v2, 0) + 13 as v5,
    p.v6 * 5 as v6,
    coalesce(p.v6, 0) + 7 as v7,
    p.v6 * 3 as v8
from {{ ref('int_ev_0046') }} as p
