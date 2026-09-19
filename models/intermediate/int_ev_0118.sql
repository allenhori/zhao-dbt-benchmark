select
    p.event_id as event_id,
    p.customer_id as customer_id,
    p.segment_id as segment_id,
    coalesce(p.v6, 0) + 5 as v1,
    case when p.v6 > 1300 then p.v6 else 0 end as v2,
    p.v6 * 7 as v3,
    p.v5 + p.v6 as v4,
    p.v5 - p.v6 as v5,
    p.v6 - p.v5 as v6,
    round(p.v5 / 2.0, 4) as v7,
    case when p.v6 > p.v5 then p.v6 else p.v5 end as v8
from {{ ref('int_ev_0008') }} as p
