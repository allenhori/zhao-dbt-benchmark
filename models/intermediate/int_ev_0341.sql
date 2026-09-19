select
    p.event_id as event_id,
    p.customer_id as customer_id,
    p.segment_id as segment_id,
    round(p.v3 / 3.0, 4) as v1,
    round(p.v3 / 3.0, 4) as v2,
    case when p.v4 > 1300 then p.v4 else 0 end as v3,
    coalesce(p.v3, 0) + 7 as v4,
    p.v3 * 5 as v5,
    case when p.v4 > p.v3 then p.v4 else p.v3 end as v6,
    case when p.v3 > 1300 then p.v3 else 0 end as v7,
    p.v4 + p.v3 as v8
from {{ ref('int_ev_0116') }} as p
