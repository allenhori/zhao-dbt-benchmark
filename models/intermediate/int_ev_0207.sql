select
    p.event_id as event_id,
    p.customer_id as customer_id,
    p.segment_id as segment_id,
    p.m12 + 13 as v1,
    p.m12 * 0.5 + p.m6 * 0.5 as v2,
    case when p.m6 > 700 then p.m6 else 0 end as v3,
    case when p.m12 > 200 then p.m12 else 0 end as v4,
    round(p.m12 / 2.0, 4) as v5,
    round(p.m12 / 3.0, 4) as v6,
    round(p.m6 / 13.0, 4) as v7,
    p.m12 + p.m6 as v8
from {{ ref('stg_ev_05') }} as p
