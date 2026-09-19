select
    p.event_id as event_id,
    p.customer_id as customer_id,
    p.segment_id as segment_id,
    p.m2 - p.m11 as v1,
    case when p.m2 > 500 then p.m2 else 0 end as v2,
    coalesce(p.m2, 0) + 13 as v3,
    case when p.m11 > p.m2 then p.m11 else p.m2 end as v4,
    p.m2 - p.m11 as v5,
    p.m11 * 13 as v6
from {{ ref('stg_ev_03') }} as p
