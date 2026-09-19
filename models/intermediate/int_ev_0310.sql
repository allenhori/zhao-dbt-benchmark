select
    p.event_id as event_id,
    p.customer_id as customer_id,
    p.segment_id as segment_id,
    coalesce(p.v7, 0) + 3 as v1,
    round(p.v6 / 5.0, 4) as v2,
    p.v6 - p.v7 as v3,
    p.v7 + 3 as v4,
    p.v7 + p.v6 as v5,
    case when p.v7 > p.v6 then p.v7 else p.v6 end as v6,
    p.v6 - p.v7 as v7
from {{ ref('int_ev_0000') }} as p
