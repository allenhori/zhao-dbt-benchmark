select
    p.event_id as event_id,
    p.customer_id as customer_id,
    p.segment_id as segment_id,
    case when p.v3 > 1300 then p.v3 else 0 end as v1,
    round(p.v6 / 2.0, 4) as v2,
    p.v3 + 11 as v3,
    case when p.v6 > 200 then p.v6 else 0 end as v4,
    case when p.v1 > 1100 then p.v1 else 0 end as v5,
    coalesce(p.v3, 0) + 11 as v6,
    p.v1 * 13 as v7,
    p.v3 + 2 as v8
from {{ ref('int_ev_0030') }} as p
