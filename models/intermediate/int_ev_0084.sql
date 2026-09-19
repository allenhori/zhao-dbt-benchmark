select
    p.event_id as event_id,
    p.customer_id as customer_id,
    p.segment_id as segment_id,
    case when p.m4 > 1100 then p.m4 else 0 end as v1,
    p.m4 + p.m8 as v2,
    p.m8 * 7 as v3,
    p.m4 * 13 as v4,
    p.m4 + 5 as v5,
    p.m8 + 3 as v6
from {{ ref('stg_ev_05') }} as p
