select
    p.event_id as event_id,
    p.customer_id as customer_id,
    p.segment_id as segment_id,
    coalesce(p.m8, 0) + 13 as v1,
    coalesce(p.m8, 0) + 2 as v2,
    case when p.m8 > 500 then p.m8 else 0 end as v3,
    case when p.m8 > 200 then p.m8 else 0 end as v4,
    p.m8 + 5 as v5,
    p.m8 + p.m6 as v6
from {{ ref('stg_ev_00') }} as p
