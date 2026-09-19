select
    p.event_id as event_id,
    p.customer_id as customer_id,
    p.segment_id as segment_id,
    round(p.v5 / 5.0, 4) as v1,
    coalesce(p.v3, 0) + 5 as v2,
    coalesce(p.v3, 0) + 13 as v3,
    round(p.v3 / 5.0, 4) as v4,
    case when p.v6 > 700 then p.v6 else 0 end as v5,
    case when p.v3 > 500 then p.v3 else 0 end as v6,
    round(p.v5 / 3.0, 4) as v7,
    case when p.v6 > 1100 then p.v6 else 0 end as v8
from {{ ref('int_ev_0004') }} as p
