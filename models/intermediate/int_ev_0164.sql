select
    p.event_id as event_id,
    p.customer_id as customer_id,
    p.segment_id as segment_id,
    p.v6 + 7 as v1,
    round(p.v6 / 5.0, 4) as v2,
    case when p.v6 > p.v4 then p.v6 else p.v4 end as v3,
    p.v6 + 5 as v4,
    p.v4 + p.v6 as v5,
    coalesce(p.v6, 0) + 7 as v6,
    p.v6 + 11 as v7,
    coalesce(p.v6, 0) + 7 as v8
from {{ ref('int_ev_0001') }} as p
