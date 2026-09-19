select
    p.event_id as event_id,
    p.customer_id as customer_id,
    p.segment_id as segment_id,
    case when p.v4 > p.v2 then p.v4 else p.v2 end as v1,
    coalesce(p.v2, 0) + 11 as v2,
    coalesce(p.v4, 0) + 11 as v3,
    round(p.v2 / 7.0, 4) as v4,
    case when p.v2 > 500 then p.v2 else 0 end as v5,
    round(p.v2 / 3.0, 4) as v6
from {{ ref('int_ev_0006') }} as p
