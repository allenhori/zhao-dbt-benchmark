select
    p.event_id as event_id,
    p.customer_id as customer_id,
    p.segment_id as segment_id,
    case when p.v8 > 700 then p.v8 else 0 end as v1,
    case when p.v8 > 500 then p.v8 else 0 end as v2,
    p.v4 + 3 as v3,
    p.v4 + 11 as v4,
    round(p.v7 / 11.0, 4) as v5,
    round(p.v8 / 7.0, 4) as v6,
    p.v7 + 7 as v7
from {{ ref('int_ev_0061') }} as p
