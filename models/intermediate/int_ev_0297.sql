select
    p.event_id as event_id,
    p.customer_id as customer_id,
    p.segment_id as segment_id,
    p.v1 + 5 as v1,
    case when p.v7 > 700 then p.v7 else 0 end as v2,
    case when p.v1 > 300 then p.v1 else 0 end as v3,
    case when p.v1 > 1100 then p.v1 else 0 end as v4,
    p.v7 + 11 as v5,
    coalesce(p.v7, 0) + 11 as v6
from {{ ref('int_ev_0203') }} as p
