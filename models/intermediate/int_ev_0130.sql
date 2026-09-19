select
    p.event_id as event_id,
    p.customer_id as customer_id,
    p.segment_id as segment_id,
    p.v8 - p.v6 as v1,
    round(p.v5 / 2.0, 4) as v2,
    round(p.v8 / 7.0, 4) as v3,
    p.v6 + p.v5 as v4,
    p.v8 - p.v6 as v5,
    case when p.v5 > 300 then p.v5 else 0 end as v6,
    coalesce(p.v8, 0) + 5 as v7,
    round(p.v5 / 11.0, 4) as v8
from {{ ref('int_ev_0023') }} as p
